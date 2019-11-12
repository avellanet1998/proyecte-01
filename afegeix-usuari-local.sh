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

  #6-Check user
  if id -u "$username"> /dev/null 2>&1 
    then echo'El usuario se ha creado correctamente'
  else
    echo 'El usuario no se ha creado correctamente'
  fi

  #7-Set the password
  `passwd $username`
 
else
  echo 'No tienes permisos.'
fi
