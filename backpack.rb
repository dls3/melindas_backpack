class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    dress_for_weather
    pack_gym_shoes
    pack_lunch
  end

  def items
    @items
  end

  def dress_for_weather
    weather = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]

    # Ensure appropriate clothing is added to backpack
    if weather == 'rainy'
      items_for_rain
    elsif weather == 'cold'
      items_for_cold
    else
      items_for_unspecified_weather
    end

  end

  # Ensure gym shoes are added to backpack if it's a gym day (monday or thursday)
  def pack_gym_shoes
    day_of_week = @attributes[:day_of_week]
    if gym_day?
      @items << 'gym shoes'
    end
  end

  # Bring a packed lunch on all weekdays
  def pack_lunch
    day_of_week = @attributes[:day_of_week]
    if weekday?
      @items << 'packed lunch'
    elsif
      @items << 'snacks'
    end
  end

  def items_for_rain
    @items << 'pants'
    @items << 'shirt'
    @items << 'umbrella'
  end

  def items_for_cold
    @items << 'pants'
    @items << 'shirt'
    @items << 'jacket'
  end

  def items_for_unspecified_weather
    @items << 'pants'
    @items << 'shirt'
  end

  def weekday?
    day_of_week = @attributes[:day_of_week]
    day_of_week != 'saturday' && day_of_week != 'sunday'
  end

  def gym_day?
    day_of_week = @attributes[:day_of_week]
    day_of_week == 'monday' || day_of_week == 'thursday'
  end

  # Prints a summary packing list for Melinda's backpack
  def packing_summary_output
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

end
