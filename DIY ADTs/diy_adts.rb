# Exercise 1 - Stack (LIFO)
 class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end

# Exercise 2 - Queue (FIFO)
class Queue
  def initialize
    @queue = []
  end
  
  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end
end

# Exercise 3 - Map (2D Array)
class Map
  def initialize
    @map = []
  end

  def set(key, value)
    if !self.has(key)
      @map << [key, value]
    else
      @map.each_with_index do |(k, v), i|
        if k == key
          @map[i] = [key, value]
        end
      end
    end
    self
  end

  def has(key)
    @map.any? { |k, v| k == key }
  end

  def get(key)
    @map.each { |k, v| return v if k == key }
    nil
  end

  def delete(key)
    @map.each_with_index do |(k, v), i|
      if k == key
        @map.slice!(i)
        return true
      end
    end
    false
  end

  def show
    @map
  end
end

