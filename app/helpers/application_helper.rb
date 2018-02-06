module ApplicationHelper
  def render_single_or_deplex(house)
    if house.is_duplex
      t('is_duplex')
    else
      t('is_single')
    end
  end
  def render_yes_or_no(condition)
    if condition==='1'
      t('my_yes')
    else
      t('my_no')
    end
  end
  def render_with_or_without(condition)
    if condition === '1'
      t('my_with')
    else
      t('my_without')
    end
  end
  def render_malleability_degree(condition)
    if condition === '0'
      t('low')
    elsif condition ==='1'
      t('middle')
    elsif condition ==='2'
      t('high')
    end
  end
  def render_education_resources_degree(condition)
    if condition === '0'
      t('rare')
    elsif condition === '1'
      t('medium')
    elsif condition === '2'
      t('plenty')
    end
  end
  def render_convinence_level(condition)
    if condition === '0'
      t('low')
    elsif condition === '1'
      t('middle')
    elsif condition === '2'
      t('high')
    end
  end
  def render_passage_level(condition)
    if condition === '0'
      t('narrow')
    elsif condition === '1'
      t('medium')
    elsif condition === '2'
      t('wide')
    end
  end
end
