module TodoItemsHelper
	def convert_hex_to_rgba(hex)
	  return "rgba(#{hex[1,2].hex.to_s},#{hex[3,2].hex.to_s},#{hex[5,2].hex.to_s},0.75);"
	end

	def is_color_dark?(hex)
	  r = hex[1,2].hex
	  g = hex[3,2].hex
	  b = hex[5,2].hex

	  return (r + g + b)/3.0 < 90.0 ? true : false
	end

	def get_friendly_date_string(date)
	  now = Time.now
	  day_of_week = date.strftime('%A') + ", "
	  year = ", " + date.strftime('%Y')

	  # if it is not due within 45 days, I don't care what day of the week it is
	  day_of_week = "" if (date.strftime('%s').to_i - now.strftime('%s').to_i).abs > 60*60*24*45
	  # if it is the current year, I don't need to display it
	  year = "" if date.year == now.year

	  return day_of_week + date.strftime('%B') + " " + ordinalize(date.day) + year;
	end

	def ordinalize(number)
	  if (11..13).include?(number.to_i.abs % 100)
	    "#{number}th"
	  else
	    case number.to_i.abs % 10
	      when 1; "#{number}st"
	      when 2; "#{number}nd"
	      when 3; "#{number}rd"
	      else    "#{number}th"
	    end
	  end
	end

	def sort_todo_items

	end
end
