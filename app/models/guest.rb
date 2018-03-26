class Guest < ApplicationRecord
  # validates_format_of :phone,
  #   :with=> /1\d{10}/,
  #   :message=> '请输入正确的电话号码!'
  has_many :refer_guests,:dependent=>:destroy
  has_many :guest_options
  has_many :options,through: :guest_options
  accepts_nested_attributes_for :refer_guests,:allow_destroy=>true,:reject_if=>:all_blank

  def country_name(country_code)
    # country_select is used with Guest attribute `country_code`
    # This will attempt to translate the country name and use the default
    # (usually English) name if no translation is available
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
  def show_option(option)
    option.gsub!(/[\[\]]/,'');
    option.gsub!(/[\"]/,'');
    option.gsub!(/\,/,' ');
  end
end
