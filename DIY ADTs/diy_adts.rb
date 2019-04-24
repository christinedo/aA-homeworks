# Exercise 1 - Stack (LIFO)
 class Stack
  def initialize
    @structure = []
  end

  def push(el)
    @structure << el
    el
  end

  def pop
    @structure.pop
  end

  def peek
    @structure.last
  end
end

# Exercise 2 - Queue (FIFO)
class Queue
  def initialize
    @structure = []
  end
  
  def enqueue(el)
    @structure << el
    el
  end

  def dequeue
    @structure.shift
  end

  def peek
    @structure.first
  end
end

# Exercise 3 - Map (2D Array)
class Map
  def initialize
    @structure = []
  end

  def set(key, value)
    if !self.has(key)
      @structure << [key, value]
    else
      existing_idx = @structure.index { |(k, v), i| k == key }
      @structure[existing_idx] = [key, value]
    end
    self
  end

  def has(key)
    @structure.any? { |k, v| k == key }
  end

  def get(key)
    @structure.each { |k, v| return v if k == key }
    nil
  end

  def delete(key)
    @structure.each_with_index do |(k, v), i|
      if k == key
        @structure.slice!(i)
        return true
      end
    end
    false
  end

  # Should be deep-copy of underlying structure
  def show
    @structure
  end
end
