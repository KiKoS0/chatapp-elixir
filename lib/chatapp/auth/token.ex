defmodule Chatapp.Token do
  @signing_salt "octosell_api"
  # token for 2 week
  @token_age_secs 14 * 86_400

  @doc """
  Create token for given data
  """
  @spec sign(map()) :: binary()
  def sign(data) do
    Phoenix.Token.sign(Chatapp.Endpoint, @signing_salt, data)
  end


  @doc """
  Verify given token by:
  - Verify token signature
  - Verify expiration time
  """
  @spec verify(String.t()) :: {:ok, any()} | {:error, :unauthenticated}
  def verify(token) do
    case Phoenix.Token.verify(Chatapp.Endpoint, @signing_salt, token,
             max_age: @token_age_secs
           ) do
      {:ok, data} -> {:ok, data}
      _error -> {:error, :unauthenticated}
    end
  end
end
