#include "sprites.agc"
#include "input.agc"
#include "main.agc"

//Variáveis de controle

global vida as integer = 100
global vidaChefe as integer = 250
global pontos as integer = 0
global flechaX as integer = 0
global acertouTela as integer = 0
global apertouX as integer = 0
global movFlecha as integer = 0
global acertouHeroi1 as integer = 0
global acertouHeroi2 as integer = 0
global acertouHeroi3 as integer = 0
global acertouHeroi4 as integer = 0
global acertouHeroi5 as integer = 0
global acertouHeroi6 as integer = 0
global acertouHeroi7 as integer = 0
global borda as integer = 0 
global borda2 as integer = 0
global testeM as integer = 0
global testeM2 as integer = 0
global testeM3 as integer = 0
global testeM4 as integer = 0
 
posicaoFlecha as float = 0.0
temp as integer = 0

//Movimento e posicionamento dos inimigos

function moverInimigoDirEsq()
	
	if GetSpriteX(7) < -300
		acertouHeroi1 = 0  
		SetSpritePosition(7, Random(2000,4000), 750)
	endif
	
	if GetSpriteX(8) < -300 
		acertouHeroi2 = 0 
		SetSpritePosition(8, Random(2000,4000), 758)
	endif
	
	if GetSpriteX(9) < -300 
		acertouHeroi3 = 0 
		SetSpritePosition(9, Random(2000,4000), 758)
	endif
	
	if GetSpriteX(10) > 1900 
		acertouHeroi4 = 0
		SetSpritePosition(10, Random2(-500, -1500), 750)
	endif
	
	if GetSpriteX(11) > 1900 
		acertouHeroi5 = 0 
		SetSpritePosition(11, Random2(-500, -1500), 758)
	endif
	
	if GetSpriteX(12) > 1900
		acertouHeroi6 = 0  
		SetSpritePosition(12, Random2(-500, -1500), 758)
	endif
	
	aceleracao = timer() * 0.08
	
	SetSpritePosition(7, GetSpriteX(7)-4-aceleracao, 750)
	SetSpritePosition(8, GetSpriteX(8)-4-aceleracao, 758)
	SetSpritePosition(9, GetSpriteX(9)-4-aceleracao, 750)
	SetSpritePosition(10, GetSpriteX(10)+4+aceleracao, 750)
	SetSpritePosition(11, GetSpriteX(11)+4+aceleracao, 758)
	SetSpritePosition(12, GetSpriteX(12)+4+aceleracao, 758)
	
endfunction

//Deslocamento da flecha do personagem 

flechaMov:
	
	if GetRawKeyPressed(Key_X) = 1 
		
		apertouX = 1
		acertouTela = 0
		
	endif
	 
	if apertouX = 1 and acertouTela = 0 and direita = 1 and escudoAtivado = 0
		
		if temp = 0
			
			SetSpritePosition(flecha, GetSpriteX(1)+100, 880)
			temp = 1
		
		endif
		
		flechaX = flechaX - 12 
		SetSpriteFlip(flecha, 1, 0)
		SetSpritePosition(flecha, GetSpriteX(flecha)-12, 880)
		
	endif
			
	if apertouX = 1 and acertouTela = 0 and direita = 0 and escudoAtivado = 0
		
		if temp = 0
			
			SetSpritePosition(flecha, GetSpriteX(1)+100, 880)
			temp = 1
		
		endif
		
		flechaX = flechaX + 12
		SetSpriteFlip(flecha, 0, 0)
		SetSpritePosition(flecha, GetSpriteX(flecha)+12, 880)
			
	endif
	
	posicaoFlecha = GetSpriteX(flecha)
	
	if posicaoFlecha => 1920.0 or posicaoFlecha <= 0
		
		flechaX = 0	
		acertouTela = 1
		SetSpritePosition(flecha, 6000, 880)
		apertouX = 0
		temp = 0
	
	endif
	
	//Colisão da flecha com os monstros e reposicionamento dos monstros
	if GetSpriteCollision(flecha, 7) = 1
		
		PlaySound(esqueletoS, 50, 0, 0)
		flechaX = 0
		acertouTela = 1
		apertouX = 0
		SetSpritePosition(7, Random(2000,4000), 758)
		SetSpritePosition(flecha, 6000, 880)
		pontos = pontos + 5
	
	endif
	
	if GetSpriteCollision(flecha, 8) = 1
		
		PlaySound(cogumeloS, 50, 0, 0)
		flechaX = 0
		acertouTela = 1
		apertouX = 0
		SetSpritePosition(8, Random(2000,4000), 758)
		SetSpritePosition(flecha, 6000, 880)
		pontos = pontos + 5
	
	endif
	
	if GetSpriteCollision(flecha, 9) = 1
		
		PlaySound(goblimS, 50, 0, 0)
		flechaX = 0
		acertouTela = 1
		apertouX = 0
		SetSpritePosition(9, Random(2000,4000), 758)
		SetSpritePosition(flecha, 6000, 880)
		pontos = pontos + 5
	
	endif
	
	if GetSpriteCollision(flecha, 10) = 1
		
		PlaySound(esqueletoS, 50, 0, 0)
		flechaX = 0
		acertouTela = 1
		apertouX = 0
		SetSpritePosition(10, Random(2000,4000), 758)
		SetSpritePosition(flecha, 6000, 880)
		pontos = pontos + 5
	
	endif
	
	if GetSpriteCollision(flecha, 11) = 1
		
		PlaySound(cogumeloS, 50, 0, 0)
		flechaX = 0
		acertouTela = 1
		apertouX = 0
		SetSpritePosition(11, Random(2000,4000), 758)
		SetSpritePosition(flecha, 6000, 880)
		pontos = pontos + 5
	
	endif
	
	if GetSpriteCollision(flecha, 12) = 1
		
		PlaySound(goblimS, 50, 0, 0)
		flechaX = 0
		acertouTela = 1
		apertouX = 0
		SetSpritePosition(12, Random(2000,4000), 758)
		SetSpritePosition(flecha, 6000, 880)
		pontos = pontos + 5
	
	endif
	
return

//Surgimento do chefe final

function chefe(ganhouS as integer, golemS as integer, golemPassosS as integer)

	if pontos >= 50
		
		if testeM2 = 0
			
			PlaySound(golemS, 100, 0, 0)
			PlaySound(golemPassosS, 20, 1, 0)
			testeM2 = 1
			
		endif
		
		PrintC("Vida do chefe: ")
		Print(vidaChefe)
		
		if borda = 0 
			
			SetSpritePosition(13, GetSpriteX(13)-4, 700)
		
		endif
		
		if GetSpriteX(13) <= -300
			
			borda = 1
			
		endif
		
		//Faz com que o chefe vire e volte ao chegar no fim da tela
		if borda = 1
			
			acertouHeroi7 = 0
			SetSpriteFlip(13, 0, 0)
			SetSpritePosition(13, GetSpriteX(13)+4, 700)
			borda2 = 1
			
		endif
		
		if borda2 = 1 and GetSpriteX(13) >= 1920
			
			borda = 0
			acertouHeroi7 = 0
			SetSpriteFlip(13, 1, 0)
			SetSpritePosition(13, GetSpriteX(13)-8, 700)
			
		endif

	endif
	
	//Colisão da flecha com o chefe
	if GetSpriteCollision(flecha, 13) = 1 and apertouX = 1
		
		apertouX = 0
		vidaChefe = vidaChefe - 15
		SetSpritePosition(flecha, 6000, 880)
		
	endif
	
	//Teste se o jogador ganhou
	if vidaChefe <= 0
		
		vidaChefe = 0
		
		if testeM = 0
			
			StopMusicOGG(2)
			StopSound(golemPassosS)
			PlaySound(ganhouS, 80, 0, 0)
			SetSpriteVisible(18, 1)
			SetPrintColor(0, 0, 0, 0)
			testeM = 1
			
		endif
		
	
		SetSpritePosition(13, 10000, 10000)
		SetSpritePosition(1, 5000, 5000)
		
		if GetRawKeyPressed(Key_Esc) = 1
			
			end
			
		endif
		
	endif
	
endfunction

//Contador de vida do personagem

function vida(perdeuS as integer)
	
	//Teste se o jogador morreu
	if vida <= 0
	
		vida = 0
		
		if testeM4 = 0
			
			StopMusicOGG(2)
			StopSound(golemPassosS)
			PlaySound(perdeuS, 80, 0, 0)
			SetSpriteVisible(19, 1)
			SetPrintColor(0, 0, 0, 0)
			testeM4 = 1
			
		endif
	
		PrintC("Pontos: ")
		Print(pontos)
		
		//SetPrintColor(0, 0, 0)
		
		SetSpritePosition(1, 5000, 5000)
		
		if GetRawKeyPressed(Key_Esc) = 1
			
			end
			
		endif
			
	endif
	
	//Colisao dos monstros com o jogador
	if GetSpriteCollision(1, 7) = 1 and acertouHeroi1 = 0 and tangivel = 0
		
		acertouHeroi1 = 1
		vida = vida - 10
		
	endif
	
	if GetSpriteCollision(1, 8) = 1 and acertouHeroi2 = 0 and tangivel = 0
		
		acertouHeroi2 = 1
		vida = vida - 15
		
	endif
	
	if GetSpriteCollision(1, 9) = 1 and acertouHeroi3 = 0 and tangivel = 0
		
		acertouHeroi3 = 1
		vida = vida - 20
		
	endif
	
	if GetSpriteCollision(1, 10) = 1 and acertouHeroi4 = 0 and tangivel = 0
		
		acertouHeroi4 = 1
		vida = vida - 20
		
	endif
	
	if GetSpriteCollision(1, 11) = 1 and acertouHeroi5 = 0 and tangivel = 0
		
		acertouHeroi5 = 1
		vida = vida - 20
		
	endif
	
	if GetSpriteCollision(1, 12) = 1 and acertouHeroi6 = 0 and tangivel = 0
		
		acertouHeroi6 = 1
		vida = vida - 20
		
	endif
	
	if GetSpriteCollision(1, 13) = 1 and acertouHeroi7 = 0 and tangivel = 0
		
		acertouHeroi7 = 1
		vida = vida - 35
		
	endif
	
endfunction

//Exibição dos textos principais

printDeTextos:
	
	PrintC("Vida: ")
	Print(vida)
	PrintC("Pontos: ")
	Print(pontos)

return


