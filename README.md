# Shell In A Box

A web AJAX based terminal in a docker box


# Options

## Should probably be set
| Environment | Value | default |
|:---|:---|:---|
| USER_NAME | The shellinabox user | ivonet |
| PASSWORD | The password for the user | <generated> |
| SUDO_ACCESS | if the user will have sudo access | false |


## Advanced settings

The settings below are advanced settings
Most should get by with the default settings

| Environment | Value | default |
|:---|:---|:---|
| USER_ID | The user id of the shellinabox user | 1000 |
| GROUP_NAME | Group to use | same as USER_NAME |
| GROUP_ID | GroupId to use | 1000 |
| USE_SSL | Force ssl connection | false |
| PORT | The port shellinabox will listen on | 4200 |
| SHELL | The shell to enable for the user | /bin/bash |
| HOME_DIR | The location of HOME for the user | /home/${USER_NAME} |
| SERVICE | Space separated services enabled on shellinabox | /:LOGIN |





