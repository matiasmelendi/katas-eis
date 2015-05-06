#MonkeyPatch to allow me to use an assignment method
class Matrix
  def []=(i, j, v)
    @rows[i][j] = v
  end
end