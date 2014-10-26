# -*- coding: utf-8 -*-
module LayoutHelper

  # Link to switch Language
  def switch_language_link
    if I18n.locale == :en
      link_to "Cambia a Español", url_for(:locale => :es)
    else
      link_to "Swith to English", url_for(:locale => :en)
    end
  end

end


