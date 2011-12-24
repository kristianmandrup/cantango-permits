module CanTango::Permit
  class Attribute < Base
    module ClassMethods
      def attribute name = nil
        @attribute ||= self.name.demodulize.gsub(/(.*)Permit/, '\1').underscore.to_sym
        return @attribute unless name
        @attribute = name
      end

      alias_method :type, :attribute
      alias_method :hash_key, :attribute

      def inherited(base_clazz)
        register_type base_clazz
        # register base_clazz, :name => attribute_name(base_clazz)
      end
    
      def attribute_name clazz = nil
        clazz ||= self
        clazz.name.demodulize.gsub(/(.*)(#{attribute.to_s.camelize}Permit)/, '\1').underscore.to_sym
      end
    end
    extend ClassMethods

    module TestAttribute
      def plural_attribute
        @pl ||= attribute.to_s.pluralize
      end

      def valid?
        test_single || test_plural
      end
  
      def test_single
        return false unless subject.respond_to?(attribute)
        subject.send(attribute) == attribute
      end
  
      def test_plural
        return false unless subject.respond_to?(plural_attribute)
        subject.send(plural_attribute).include? attribute
      end
    end
    include TestAttribute

    def permit_name
      self.class.attribute_name
    end

    def attribute name = nil
      self.class.attribute
    end
  
    class Builder < CanTango::Builder::Permit::Base
      def build
        return [] unless valid?
        super
      end
    
      protected

      include CanTango::Permit::Attribute::TestAttribute
    
      def self.attribute name = nil
        raise "No attribute defined" unless name || @attribute
        return @attribute unless name
        @attribute = name
      end
    end
  end
end
