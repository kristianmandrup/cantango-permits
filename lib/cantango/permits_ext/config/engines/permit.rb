module CanTango
  class Config
    class Engines
      class Permit # < Base
        def on?
          @state ||= :on
          @state == :on
        end
        
        protected
        
        def valid_mode_names
          [:cache, :no_cache, :both]
        end
      end
    end
  end
end


