#!/bin/bash
sed -i '/<\/PasswordGenerator>/{ 
   r ../.config/KeePass/keepass.profiles.xml
   a \</PasswordGenerator>
   d 
}' ~/.config/KeePass/KeePass.config.xml
