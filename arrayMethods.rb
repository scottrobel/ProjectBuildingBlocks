#!/usr/bin/ruby
module Enumerable
    def my_each
    array = self
        for i in 0...array.length
        yield(array[i])
        end 
        self
    end
    def my_each_with_index
        array = self
            for i in 0...array.length
            yield(array[i],i)
            end 
            self
    end
    def my_select
        selected_elements = []
        self.my_each{|e| selected_elements << e if(yield(e))}
        selected_elements
    end 
    def my_any?
        self.my_each{|e| return true if(yield(e))}
        false 
    end 
    def my_all?
        self.my_each{|e| return false if(!yield(e))}
        true
    end
    def my_none?
        self.my_all{|e| !yield(e)}
    end
    def my_count(match = nil)
        count = 0 
        if match
            self.each{|e| count+=1 if e == match} 
            return count
        end 
        if block_given?
            self.each{|e| count+=1 if yield(e)} 
            return count 
        end 
        self.size
    end 
    def my_map(proc = yield)
        resulted_array = []
        self.my_each{|e| resulted_array << proc.call(e)}
        resulted_array
    end 
    def my_inject(total = 0)
        self.each{|e| total =yield(total,e)}
        total
    end 
end
def multiply_els(array)
    array.my_inject(1){|total,element| total*element}
end
