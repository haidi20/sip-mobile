exports.login = (req, res) => {

  const data = {
    user: {
      id: 1,
      username: "haid",
      roleId: 1,
      roleName: "super admin",
    }
  }

  res.json({
    success: true,
    data
  });
}