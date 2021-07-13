defmodule Abacus.Counter do
  def new(string) do
  	String.to_integer(string)
  end

  def add(acc, n) do
  	acc + n
  end

  def render(integer) do
  	"The answer is #{integer}"
  end

end