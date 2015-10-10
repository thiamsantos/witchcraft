defmodule Witchcraft.Applicative do
  @doc """
  """

  use Behaviour

  defcallback pure :: a -> [a]
  defcallback applic :: [a] -> (a -> [b]) -> [b]


  def identity(id, elem, applic) do
    applic(pure(id), elem) == elem
  end

  def homomorphism(elem, func) do
    applic(pure(f), pure(elem)) == pure(f(pure(elem)))
  end

  def interchange(u, y, applic) do
    applic(u, pure(y)) == pure(&(y |> &1)) `applic` u
  end

  def composition(u, v, w, applic) do
    pure &(&2 |> &1) `applic` u `applic` v `applic` w == u `applic` (v `applic` w)
  end
end
