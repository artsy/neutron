class Palette
  def initialize(render_method)
    @render_method = render_method
  end

  # could define the components one at a time
  def Text(options, &block)
    component = TextComponent.new(**options)
    @render_method.call(component, &block)
  end

  # or could do meta programming
  def method_missing(method, options, &block)
    klass_name = "#{method}Component"
    component = klass_name.constantize.new(**options)
    @render_method.call(component, &block)
  end
end

module ApplicationHelper
  def r(klass_name, **options, &block)
    component = "#{klass_name}Component".constantize.new(**options)
    render(component, &block)
  end

  def p
    Palette.new(self.method(:render))
  end
end
