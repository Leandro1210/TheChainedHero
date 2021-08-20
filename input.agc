#include "functions.agc"

//Variáveis para teclas

global Key_LEFT as integer = 37
global Key_RIGHT as integer = 39
global Key_Esc as integer = 27
global Key_X as integer = 88
global Key_C as integer = 67

//Variáveis de controle

global direita as integer = 0
global tangivel as integer = 0
global escudoAtivado as integer = 0

//Movimentação do personagem

movimento:
	
	if GetRawKeyState(Key_RIGHT) = 1
		
		SetSpriteFlip(1,0,0)
		SetSpritePosition(1, GetSpriteX(1)+10 , GetSpriteY(1))
	
	endif
	
	if (GetRawKeyPressed(Key_RIGHT) = 1 and GetSpriteX(flecha) = 6000)
		
		direita = 0
		PlaySprite(1, 12, 1, 11, 18)
			
	endif
	
	if (GetRawKeyReleased(Key_RIGHT) = 1)
		
		SetSpriteFlip(1,0,0)
		PlaySprite (1, 12, 1, 1, 10)
			
	endif
	
	if GetRawKeyState(Key_LEFT) = 1 
		
		SetSpriteFlip(1,1,0)
		SetSpritePosition(1, GetSpriteX(1)-10 , GetSpriteY(1))
	
	endif
	
	if (GetRawKeyPressed (Key_LEFT) = 1 and GetSpriteX(flecha) = 6000)
		
		direita = 1
		PlaySprite(1, 12, 1, 11, 18)
					
	endif
	
	if (GetRawKeyReleased(Key_LEFT) = 1) 
			
		SetSpriteFlip(1,1,0)
		PlaySprite (1, 12, 1, 1, 10)
		
	endif
		
return

//Ataque do jogador

function ataque(flechaS as integer)
	
	if (GetRawKeyPressed(Key_X) = 1 and escudoAtivado = 0)
		
		PlaySound(flechaS)
		PlaySprite(1, 12, 0, 19, 24)
			
		if direita = 1
			SetSpriteFlip(1,1,0)
		else
			SetSpriteFlip(1,0,0)
		endif
		
	endif
	 
endfunction

//Defesa do jogador

function escudo(auraS as integer)
	
	if GetRawKeyPressed(Key_C) = 1
	
		PlaySprite(20, 20, 1, 1, 18)
		
	endif
	
	if GetRawKeyState(Key_C) = 1
		
		if testeM3 = 0
			
			PlaySound(auraS, 85, 1, 0)
			testeM3 = 1
			
		endif
		
		SetSpritePosition(20, GetSpriteX(1), 800)
		SetSpriteColorAlpha(20, 255)
		SetSpriteColorAlpha(1, 200)
		tangivel = 1
		escudoAtivado = 1
		
	else
		
		StopSound(auraS)
		SetSpriteColorAlpha(1, 255)
		SetSpriteColorAlpha(20, 0)
		tangivel = 0
		testeM3 = 0
		escudoAtivado = 0
		
	endif 

endfunction

//Sair do jogo com Esc

function sair()
	
	if(GetRawKeyPressed(Key_Esc) = 1)
		end
	endif
	
endfunction
