// Project: The Chained Hero 
// Created: 2021-06-06

#include "sprites.agc"
#include "screen.agc"
#include "input.agc"
#include "functions.agc"

global aceleracao as float = 0.0
global ganhouS as integer = 0
global perdeuS as integer = 0
global golemS as integer = 0
global golemPassosS as integer = 0
global flechaS as integer = 0
global esqueletoS as integer = 0
global cogumeloS as integer = 0
global goblimS as integer = 0
global auraS as integer = 0

testemenu as integer = 1

LoadMusicOGG(1, "menu.ogg")
LoadMusicOGG(2, "MusicaJogo.ogg")
ganhouS = LoadSoundOGG("Ganhou.ogg")
perdeuS = LoadSoundOGG("Perdeu.ogg")
golemS = LoadSoundOGG("GolemS.ogg")
golemPassosS = LoadSoundOGG("GolemPassos.ogg")
flechaS = LoadSoundOGG("FlechaS.ogg")
esqueletoS = LoadSoundOGG("EsqueletoS.ogg")
cogumeloS = LoadSoundOGG("CoguS.ogg")
goblimS = LoadSoundOGG("GoblimS.ogg")
auraS = LoadSoundOGG("auraS.ogg")

display()
Gosub startAssets

AddVirtualButton(1, 960, 640, 100)
AddVirtualButton(2, 960, 760, 100)
AddVirtualButton(3, 6000, 6000, 100)
AddVirtualButton(4, 960, 840, 100)


//Tocar música menu

if (testemenu = 1)
		
	PlayMusicOGG(1, 1)

endif
   
do	
	
	//Teste para inciar o menu
	
	if testemenu = 1
		
		SetVirtualButtonAlpha(1, 0)
		SetVirtualButtonAlpha(2, 0)
		SetVirtualButtonAlpha(3, 0)
		SetVirtualButtonAlpha(4, 0)
		SetSpriteVisible(14, 1)
		SetSpriteVisible(15, 1)
		
		//Teste para iniciar o jogo
		
		if GetVirtualButtonPressed(1) = 1
			
			testemenu = 2
			
			//Tocar música do jogo
			PlayMusicOGG(2, 1)
				
		endif
		
		if GetVirtualButtonPressed(2) = 1
			
			SetVirtualButtonPosition(1, 6000, 6000)
			SetVirtualButtonPosition(2, 6000, 6000)
			SetVirtualButtonPosition(3, 960, 930)
			SetVirtualButtonPosition(4, 6000, 6000)
			SetSpriteVisible(23, 1)
			SetSpriteVisible(22, 1)
				
		endif
		
		if GetVirtualButtonPressed(3) = 1
			
			SetSpriteVisible(23, 0)
			SetSpriteVisible(22, 0)
			SetVirtualButtonPosition(1, 960, 640)
			SetVirtualButtonPosition(2, 960, 760)
			SetVirtualButtonPosition(3, 6000, 6000)
			SetVirtualButtonPosition(4, 960, 840)
				
		endif
		
		//Teste para sair do jogo
		
		if GetVirtualButtonPressed(4) = 1
			
			end
		
		endif
			
	//Iniciar o jogo
		
	elseif testemenu = 2
	
	PauseMusicOGG(1)
	SetVirtualButtonPosition(1, 8000, 8000)
	SetVirtualButtonPosition(2, 8000, 8000)
	SetSpriteVisible(14, 0)
	SetSpriteVisible(15, 0)
	SetSpriteVisible(16, 0)
	SetSpriteVisible(17, 0)
	SetSpriteVisible(21, 0)
	
	moverInimigoDirEsq()
	Gosub movimento
	ataque(flechaS)
	escudo(auraS)
	vida(perdeuS)
	Gosub flechaMov
	chefe(ganhouS, golemS, golemPassosS)
	Gosub printDeTextos
	sair()
    endif
    Sync()
loop
