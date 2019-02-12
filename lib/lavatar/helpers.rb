module Lavatar
  module Helpers
    def lavatar_tag(letters, size, options = {})
      key         = options[:key]         || letters
      saturation  = options[:saturation]  || Lavatar.configuration.saturation
      lightness   = options[:lightness]   || Lavatar.configuration.lightness
      color       = options[:color]       || key_to_color(key, saturation, lightness)
      font_color  = options[:font_color]  || Lavatar.configuration.font_color
      font_size   = options[:font_size]   || Lavatar.configuration.font_size
      font_weight = options[:font_weight] || Lavatar.configuration.font_weight
      klass       = options[:class]

      svg_attrs = {
        width: size,
        height: size,
        class: klass,
        viewBox: "0 0 100 100",
      }

      rect_attrs = {
        x: "0",
        y: "0",
        width: "100",
        height: "100",
        fill: color,
      }

      text_attrs = {
        x: "50%",
        y: "50%",
        fill: font_color,
        "font-size": font_size,
        "font-weight": font_weight,
        "alignment-baseline": "central",
        "text-anchor": "middle",
      }

      content_tag :svg, svg_attrs do
        tag(:rect, rect_attrs) + content_tag(:text, letters, text_attrs)
      end
    end

  private

    def key_to_color(key, saturation, lightness)
      hue = Digest::MD5.hexdigest(key)[0..5].to_i(16).to_f/0xFFFFFF
      hsl_to_rgb(hue, saturation, lightness)
    end

    def hsl_to_rgb(h, s, l)
      if s == 0 # achromatic
        r, g, b = l, l, l
      else
        hue2rgb = lambda do |m1, m2, h|
          h += 1 if h < 0
          h -= 1 if h > 1
          return m1 + (m2 - m1) * h * 6 if h * 6 < 1
          return m2 if h * 2 < 1
          return m1 + (m2 - m1) * (2.0/3 - h) * 6 if h * 3 < 2
          return m1
        end

        m2 = l < 0.5 ? l * (s + 1) : l + s - l * s
        m1 = l * 2 - m2
        r = hue2rgb.call(m1, m2, h + 1.0/3)
        g = hue2rgb.call(m1, m2, h)
        b = hue2rgb.call(m1, m2, h - 1.0/3)
      end

      "#%02x%02x%02x" % [(r*255).to_i, (g*255).to_i, (b*255).to_i]
    end
  end
end
