# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  attr_reader :disabled

  def initialize(variant:, disabled: false)
    @variant = variant
    @disabled = disabled
  end

  def tag_class
    "palette-button-#{@variant}"
  end
end
