defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true
  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 27,
        address: "Rua Carvalho",
        cep: "12345678",
        cpf: "11111111111",
        name: "Rafael",
        password: "123456",
        email: "rafael@rockelivery.com"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Rafael"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        age: 27,
        address: "Rua Carvalho",
        cep: "12345678",
        cpf: "11111111111",
        name: "Rafael",
        password: "123456",
        email: "rafael@rockelivery.com"
      }

      update_params = %{
        name: "Rafael Manfrim",
        password: "123456"
      }

      changeset = User.changeset(params)

      response = User.changeset(changeset, update_params)

      assert %Changeset{changes: %{name: "Rafael Manfrim"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        age: 15,
        address: "Rua Carvalho",
        cep: "12345678",
        cpf: "11111111111",
        name: "Rafael",
        password: "123",
        email: "rafael@rockelivery.com"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
