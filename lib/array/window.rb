class Array
  def window(size, center, even_size_resolution=:prioritize_greater)
    return [] if size <= 0
    return [self[center]] if size == 1
    return self if size >= self.length

    closest_limit = ->(size, index) {
      return 0 if index < 0
      return size - 1 if index >= size
      index }
    array_closest_limit = closest_limit.curry[self.length]

    center = array_closest_limit[center]

    lower = array_closest_limit[center - size/2]
    upper = array_closest_limit[center + size/2]
    while (lower..upper).count < size
      lower = array_closest_limit[lower - 1]
      upper = array_closest_limit[upper + 1]
    end

    return self.slice(lower..upper) if (lower..upper).count == size

    case even_size_resolution
    when :prioritize_greater
      return self.slice((lower + 1)..upper)
    when :prioritize_lower
      return self.slice(lower..(upper - 1))
    else
      raise ArgumentError, "#{even_size_resolution} is not a known resolution mechanism"
    end
  end
end
