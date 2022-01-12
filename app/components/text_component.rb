# frozen_string_literal: true

class TextComponent < ViewComponent::Base
  def initialize(variant:)
    @variant = variant
  end

  def tag_class
    "palette-text-#{@variant}"
  end
end
