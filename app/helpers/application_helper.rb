# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def text_field(object_name, method, options = {}) 
    if options[:value]
      options[:onfocus] = "if(this.value==this.defaultValue) this.value='';"
      options[:onblur] = "if(this.value=='') this.value=this.defaultValue;"
    end
    super(object_name, method, options)
  end
end
