defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view
  alias Rockelivery.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      user: user,
      token: token
    }
  end

  def render("show.json", %{user: %User{} = user}), do: %{user: user}

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
