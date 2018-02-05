module ApplicationHelper
  def render_single_or_deplex(house)
    if house.is_duplex
      '复式'
    else
      '单层'
    end
  end
end
