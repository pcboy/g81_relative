# -*- encoding : utf-8 -*-
#
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                  Version 2, December 2004
#
#  Copyright (C) 2004 Sam Hocevar
#  14 rue de Plaisance, 75014 Paris, France
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#
#
#  David Hagege <david.hagege@gmail.com>

class G81Relative
  def self.g81_relative(content)
    points = content.lines.select{|x| x =~ /Recv:/}.join("\n").gsub(/Recv:\s/, '').split(' ').map(&:to_f)

    center = points[24]
    top_left, top_middle, top_right, middle_left,
      middle_right, bottom_left,
      bottom_center, bottom_right = points.values_at(0,3,6,21,27,42,45,48).map{|x| (x - center).round(3)}

    %Q{
      #{top_left}\t#{top_middle}\t#{top_right}
      #{middle_left}\t0\t#{middle_right}
      #{bottom_left}\t#{bottom_center}\t#{bottom_right}
    }
  end
end
