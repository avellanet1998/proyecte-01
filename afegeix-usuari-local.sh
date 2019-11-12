#!/bin/bash
#https://github.com/a18joszamper/proyecte-01

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
    then echo 'El usuario se ha creado correctamente'
  else
    echo 'El usuario no se ha creado correctamente'
  fi

  #7-Set the password
  echo `$password | passwd $username`
  
  #8-passwd already check creation password.

  #9-Force passwd change first login
  passwd -e ${username}

  #10-Display username,password and the host where the user was created
  user_name=$(id -un)
  echo "Tu usuario es, $username, con contrasenya $password creado por $user_name"

else
  echo 'No tienes permisos.'
fi
