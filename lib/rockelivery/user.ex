defmodule Rockelivery.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset
  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:age, :name, :email, :password, :cpf, :cep, :address]

  @derive {Jason.Encoder, only: [:id, :name, :email, :cpf, :cep, :address]}

  schema "users" do
    field :age, :integer
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :cpf, :string
    field :cep, :string
    field :address, :string
    field :password, :string, virtual: true

    has_many :orders, Order

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
