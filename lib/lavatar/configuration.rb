module Lavatar
  class Configuration
    attr_accessor :saturation
    attr_accessor :lightness
    attr_accessor :font_size
    attr_accessor :font_weight
    attr_accessor :font_color

    def initialize
      @saturation  = 0.4
      @lightness   = 0.5
      @font_size   = 48
      @font_weight = 700
      @font_color  = "#ffffff"
    end
  end
end
