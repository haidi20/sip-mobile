exports.login = (req, res) => {
  const { name } = req.body;

  const data = {
    user: {
      id: 1,
      name: name,
      role_id: 1,
      role_name: "super admin",
    },
    token: "k23j4lk4",
    // token: null,
  }

  res.json({
    status: "success",
    data
  });
}