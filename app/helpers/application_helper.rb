module ApplicationHelper
  def render_single_or_deplex(house)
    if house.is_duplex
      t('is_duplex')
    else
      t('is_single')
    end
  end


end
