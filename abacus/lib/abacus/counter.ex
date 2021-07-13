defmodule Abacus.Counter do
  def new(string) do
  	String.to_integer(string)
  end

  def add(acc, n) do
  	acc + n
  end

  def render(integer) do
  	Integer.to_string(integer)
  end

end