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


class ActiveRecord::Base
  def apimsg_add(msg)
    errors.add(:api, message: msg)
  end
  def apimsg
    errors.messages[:api] ? errors.messages[:api].first[:message] : nil
  end
  def upperapimsg_add(msg)
    errors.add(:upperapi, message: msg)
  end
  def upperapimsg
    errors.messages[:upperapi] ? errors.messages[:upperapi].first[:message] : nil
  end
end



end
