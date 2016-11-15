class CalculationsController < ApplicationController
  def instructions
    render("instructions.html.erb")
  end

  def square
    @number = params["number"].to_i
    @squared_number = @number**2
    render("square.html.erb")
  end

  def square_root
    @number = params["number"].to_i
    @squared_root_number = Math.sqrt(@number)
    render("square_root.html.erb")
  end

  def range_number
    @min = params["min"].to_i
    @max = params["max"].to_i
    @random_number= rand(@min..@max)
    render("random.html.erb")
  end

  def loan_payment
  @apr = params[:interest_rate].to_f
  @apr_display = @apr/100
  @years = params[:number_of_years].to_i
  @principal = params[:principal_value].to_i

  loan_months = @years*12*-1
  rate_months = @apr/12/10000

  denom_rate = (1+rate_months)**loan_months
  denom = 1 - denom_rate
  numer = rate_months/denom

  @monthly_payment = numer*@principal

  render("payment.html.erb")
end

end
