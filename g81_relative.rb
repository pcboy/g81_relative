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
  def self.convertDistanceToFractionalTurns(distance)
    screw_pitch = 0.5
    rat = Rational(distance/screw_pitch).round(1)
    rat = rat == 0/1 ? 0 : rat
    "#{rat.abs}#{rat > 0 ? 'CW' : 'CCW'}"
  end

  def self.convertDistanceToDegrees(distance)
    screw_pitch = 0.5
    deg = (distance/screw_pitch*360).round
    "#{deg.abs}°#{deg > 0 ? 'CW' : 'CCW'}"
  end

  def self.g81_relative(content)
    points = content.scan(/-?\d.\d+/).map(&:to_f)

    center = points[24]
    top_left, top_middle, top_right, middle_left,
      middle_right, bottom_left,
      bottom_center, bottom_right = points.values_at(0,3,6,21,27,42,45,48).map{|x| (x - center).round(2)}

    %Q{
      Raw values:
      #{top_left}\t#{top_middle}\t#{top_right}
      #{middle_left}\t0\t#{middle_right}
      #{bottom_left}\t#{bottom_center}\t#{bottom_right}
      
      Degrees:
      #{convertDistanceToDegrees(top_left)}\t#{convertDistanceToDegrees(top_middle)}\t#{convertDistanceToDegrees(top_right)}
      #{convertDistanceToDegrees(middle_left)}\t0\t#{convertDistanceToDegrees(middle_right)}
      #{convertDistanceToDegrees(bottom_left)}\t#{convertDistanceToDegrees(bottom_center)}\t#{convertDistanceToDegrees(bottom_right)}

      Fractional Turns:
      #{convertDistanceToFractionalTurns(top_left)}\t#{convertDistanceToFractionalTurns(top_middle)}\t#{convertDistanceToFractionalTurns(top_right)}
      #{convertDistanceToFractionalTurns(middle_left)}\t0\t#{convertDistanceToFractionalTurns(middle_right)}
      #{convertDistanceToFractionalTurns(bottom_left)}\t#{convertDistanceToFractionalTurns(bottom_center)}\t#{convertDistanceToFractionalTurns(bottom_right)}
    }
  end
end
