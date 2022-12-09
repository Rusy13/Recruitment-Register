class OpenController < ApplicationController
  def input
  end

  def view
    @number = params[:num].to_i
    @res_arr = OpenController.result_array(@number)
    redirect_to lr8c_input_url, notice: 'Num < 0' if @res_arr.size.zero?
  end

  def self.result_array(num)
    arr = (0..num).select do |elem|
        ((elem**2) % (10**elem.to_s.length)).to_s == elem.to_s
      # return arr
    end
    Array(arr)
  end

end
