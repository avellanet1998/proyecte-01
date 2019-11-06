#!bin/var

# 1-Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -eq 0 ]]
then

  # 2-Get the username (login).
  read -p 'Introduce tu nombre de usuario: ' username

  # 3-Get the real name (contents for the description field).
  read -p 'Introduce tu nombre completo: ' fullname

  # 4-Get the password.
  read -s -p 'Introduce tu contraseña: ' password

  # 5-Create the user.
  useradd -c "${fullname}" -m ${username}


else
  echo 'No tienes permisos.'
fi
