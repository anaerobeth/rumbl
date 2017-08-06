defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository
  """
  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Jose", username: "josevalim", password: "elixir"},
      %Rumbl.User{id: "2", name: "Foo", username: "foo", password: "elixir1"},
      %Rumbl.User{id: "3", name: "Bar", username: "bar", password: "elixir2"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map,key) == val end)
    end
  end
end
