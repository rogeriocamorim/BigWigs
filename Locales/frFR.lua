local L = LibStub("AceLocale-3.0"):NewLocale("Big Wigs", "frFR")
if not L then return end
-- Core.lua
L["%s enabled"] = "%s activé" -- "<boss> enabled"
L["%s has been defeated"] = "%s a été vaincu(e)" -- "<boss> has been defeated"

L.bosskill = "Défaite du boss"
L.bosskill_desc = "Prévient quand le boss est vaincu."
L.berserk = "Berserk"
L.berserk_desc = "Prévient quand le boss devient fou furieux."

L.already_registered = "|cffff0000ATTENTION :|r |cff00ff00%s|r (|cffffff00%s|r) existe déjà en tant que module dans Big Wigs, mais quelque chose essaye de l'enregistrer à nouveau. Cela signifie souvent que vous avez deux copies de ce module dans votre répertoire AddOns suite à une mauvaise mise à jour d'un gestionnaire d'addons. Il est recommandé de supprimer tous les répertoires de Big Wigs et de le réinstaller complètement."

-- Loader / Options.lua
L["You are running an official release of Big Wigs %s (revision %d)"] = "Vous utilisez une version FINALISÉE de Big Wigs %s (r%d)."
L["You are running an ALPHA RELEASE of Big Wigs %s (revision %d)"] = "Vous utilisez une version ALPHA de Big Wigs %s (r%d)."
L["You are running a source checkout of Big Wigs %s directly from the repository."] = "Vous utilisez une version du dépôt de Big Wigs %s."
L["There is a new release of Big Wigs available. You can visit curse.com, wowinterface.com, wowace.com or use the Curse Updater to get the new release."] = "Une nouvelle version de Big Wigs est disponible. Vous pouvez visiter curse.com, wowinterface.com, wowace.com ou utiliser le Curse Updater pour obtenir cette nouvelle version."

L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them."] = "|cffeda55fClic gauche|r pour redémarrer les modules actifs. |cffeda55fAlt-Clic gauche|r pour les désactiver. |cffeda55fCtrl-Alt-Clic gauche|r pour désactiver complètement Big Wigs."
L["Active boss modules:"] = "Modules de boss actifs :"
L["All running modules have been reset."] = "Tous les modules actifs ont été réinitialisés."
L["Big Wigs is currently disabled."] = "Big Wigs est actuellement désactivé."
L["|cffeda55fClick|r to enable."] = "|cffeda55fCliquez|r pour l'activer."
L["|cffeda55fClick|r to reset all running modules. |cffeda55fAlt-Click|r to disable them. |cffeda55fCtrl-Alt-Click|r to disable Big Wigs completely."] = "|cffeda55fCliquez|r pour réinitialiser tous les modules actifs. |cffeda55fAlt-clic gauche|r pour les désactiver. |cffeda55fCtrl-Alt-clic gauche|r pour désactiver complètement BigWigs."
L["All running modules have been disabled."] = "Tous les modules actifs ont été désactivés."

L["There are people in your group with older versions or without Big Wigs. You can get more details with /bwv."] = "Certains joueurs de votre groupe ont d'anciennes versions ou n'ont pas Big Wigs. Tapez /bwv pour plus de détails."
L["Up to date:"] = "À jour :"
L["Out of date:"] = "Périmé :"
L["No Big Wigs 3.x:"] = "BW 3.x absent :"

-- Options.lua
L["Big Wigs Encounters"] = "Rencontres Big Wigs"
L["Customize ..."] = "Personnaliser..."
L["Profiles"] = "Profils"
--L["Welcome to Big Wigs, where the boss encounters roam. Please fasten your seatbelt, eat peanuts and enjoy the ride. It will not eat your children, but it will assist you in preparing that new boss encounter as a 7-course dinner for your raid group.\n"] = ""
L["Configure ..."] = "Configurer..."
L.configureDesc = "Ferme la fenêtre des options de l'interface et vous permet de configurer l'affichage des barres et des messages.\n\nSi vous voulez personnaliser plus en profondeur le reste de Big Wigs, étendez l'arbre de configuration sur la gauche et cliquez sur \"Personnaliser...\"."
L["Sound"] = "Son"
L.soundDesc = "Les messages sont le plus souvent accompagnés de sons. Certaines personnes trouvent plus faciles d'entendre ces sons pour réagir une fois qu'ils ont appris quels sons sont liés à quels messages plutôt que de lire les messages à chaque fois.\n\n|cffff4411Même si ceci est décoché, le son par défaut de l'Avertissement raid risque de continuer à être lu à cause des messages provenant des autres joueurs. Ce son est cependant différent de ceux que nous utilisons.|r"
L["Show Blizzard warnings"] = "Avertissements de Blizzard"
L.blizzardDesc = "Blizzard affiche ses propres messages pour certaines techniques dans certaines rencontres. À notre avis, ces messages sont trop long et trop descriptifs. Nous essayons de produire des messages plus courts et concis qui n'interfèrent pas avec votre manière de jouer et qui ne vous disent pas quoi faire à votre place.\n\n|cffff4411Quand cette case est décochée, les avertissements de Blizzard ne seront pas affichés au milieu de l'écran, mais seront toujours présents dans votre fenêtre de discussion.|r"
L["Show bossmod chat messages"] = "Afficher les messages des \"boss mods\""
L.addonwarningDesc = "BigWigs et les autres addons de boss ont une option pour diffuser les messages au groupe via la discussion. Par défaut, ces messages sont bloqués et ne sont donc pas affichés dans la fenêtre de discussion et à l'écran. Vous pouvez autoriser leur affichage via cette option.\n\n|cffff4411L'activation de cette option peut conduire à l'affichage de nombreux messages en double et n'est donc pas recommandé.|r"
L["Flash and shake"] = "Flash et secousse"
L.fnsDesc = "Certaines techniques sont tellement importantes qu'elles requièrent toute votre attention. Quand ces techniques vous affectent, Big Wigs peut faire flasher et secouer l'écran de jeu.\n\n|cffff4411Si vous avez activé les barres de vie au dessus des personnages, la fonction de secousse ne fonctionnera pas suite aux restrictions de Blizzard.|r"
L["Raid icons"] = "Icônes de raid"
L.raidiconDesc = "Certains scripts de rencontre utilisent des icônes pour marquer les joueurs affectés par des techniques précises. Par exemple, les effets de type \"bombe\" et les contrôles mentaux. Si vous décochez ceci, vous ne marquerez personne.\n\n|cffff4411Ne fonctionne que si vous êtes soit le chef du groupe (de raid), soit un de ses assistants !|r"
L["Whisper warnings"] = "Chuchoter les avertissements"
L.whisperDesc = "Envoye des chuchotements aux joueurs affectés par certaines techniques pendant les rencontres face aux boss. Pensez aux effets du type \"bombe\" et autres.\n\n|cffff4411Ne fonctionne que si vous êtes soit le chef du groupe (de raid), soit un de ses assistants !|r"
L["Broadcast"] = "Diffuser"
L.broadcastDesc = "Diffuse les messages de Big Wigs sur le canal Avertissement raid.\n\n|cffff4411Ne fonctionne que si vous êtes chef ou assistant du raid ou bien dans un groupe !|r"
L["Raid channel"] = "Canal Raid"
L["Use the raid channel instead of raid warning for broadcasting messages."] = "Utilise le canal Raid au lieu de l'Avertissement raid pour la diffusion des messages."
L["Minimap icon"] = "Icône de la minicarte"
L["Toggle show/hide of the minimap icon."] = "Affiche ou non l'icône de la minicarte."
L["Configure"] = "Configuration"
L["Test"] = "Test"
L["Reset positions"] = "Réinitialiser les positions"
L["Options for %s."] = "Options concernant %s."

L["BAR"] = "Barres"
L["MESSAGE"] = "Messages"
L["SOUND"] = "Sons"
L["ICON"] = "Icône"
L["PROXIMITY"] = "Proximité"
L["WHISPER"] = "Chuchoter"
L["SAY"] = "Dire"
L["FLASHSHAKE"] = "Flash & secousse"
L["PING"] = "Ping"
L["EMPHASIZE"] = "Mettre en évidence"
L["MESSAGE_desc"] = "La plupart des techniques des rencontres comportent un ou plusieurs messages que Big Wigs affichera sur votre écran. Si vous désactivez cette option, aucun des messages attachés à cette option, s'il y en a, ne sera affiché."
L["BAR_desc"] = "Des barres sont affichées pour certaines techniques des rencontres quand cela est approprié. Si cette technique est accompagnée par une barre que vous souhaitez cacher, désactivez cette option."
L["FLASHSHAKE_desc"] = "Certaines techniques peuvent être plus importantes que d'autres. Si vous voulez que votre écran flashe et soit secoué quand cette technique est imminente ou utilisée, cochez cette option."
L["ICON_desc"] = "Big Wigs peut marquer les joueurs affectés par des techniques avec une icône, les rendant faciles à repérer."
L["WHISPER_desc"] = "Certains effets sont assez important pour que Big Wigs envoye un chuchotement à la personne affectée."
L["SAY_desc"] = "Les bulles de dialogue sont faciles à repérer. Big Wigs fera dire un message à votre personnage pour avertir les joueurs proches qu'un effet vous affecte."
L["PING_desc"] = "Parfois votre position est importante. Big Wigs pingera la minicarte afin que les autres sachent où vous êtes."
L["EMPHASIZE_desc"] = "L'activation de ceci mettra très largement en ÉVIDENCE tout message ou barre associé à cette technique. Les messages seront plus grands, les barres clignoteront et auront une couleur différente et enfin les sons seront utilisés comme compte à rebours quand la technique est imminente. Bref, peu de chance de le louper."
L["Advanced options"] = "Options avancées"
L["<< Back"] = "<< Retour"

L["About"] = "À propos"
L["Main Developers"] = "Développeurs"
L["Maintainers"] = "Gestionnaires"
L["License"] = "Licence"
L["Website"] = "Site web"
L["Contact"] = "Contact"
L["See license.txt in the main Big Wigs folder."] = "Voir license.txt dans le dossier BigWigs"
L["irc.freenode.net in the #wowace channel"] = "irc.freenode.net sur le canal #wowace"
L["Thanks to the following for all their help in various fields of development"] = "Merci aux personnes suivantes pour leur aide :"
