require "yanying_rubyextension/version"

module YanyingRubyextension



  models = ActiveRecord::Base.connection.tables.map do |model|
    model.capitalize.singularize.camelize
  end

  arrs = [ 'Admin', 'SchemaMigration', 'SmsLog', 'Base', '..', '.' ]
  arrs += Rails.root.join('app/admin').entries.map{ |f| f.sub_ext('').to_s.camelize }
  arrs.each { |e| models.delete(e) }

  models.each do |m|
    ActiveAdmin.register m.constantize do
      menu parent: "其他"
      permit_params model.column_names
      actions :all, except: [ :destroy ]
    end
  end


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
