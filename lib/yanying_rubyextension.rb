require "yanying_rubyextension/version"

module YanyingRubyextension
  class Array
    def match?(value)
      select { |regex| value.match(regex) }.any?
    end
    def every_is?(value)
      select { |e| e != value }.any?
    end
  end

  class ActiveAdmin::ResourceDSL
    def model
      self.config.resource_name.instance_variable_get("@klass")
    end
  end
end

class ActiveRecord::Base
  def apimsg_add(msg)
    errors.add(:api, message: msg)
  end
  def apimsg
    errors.messages[:api].any? ? errors.messages[:api].first[:message] : false
  end
end
