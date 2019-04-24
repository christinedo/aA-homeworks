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