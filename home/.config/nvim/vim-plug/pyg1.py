import pygame

# win und color als Parameter übergeben, dann brauchst du nur eine Funktion
# für beide Kreise.
def circle_move_right(win, start_x, start_y, radius, move_x, color):
    pygame.draw.circle(win, color, (start_x + move_x, start_y), radius)

# Alles, was gezeichnet wird, sollte in eine Funktion ausgelagert werden.
# Dann wird auch nicht mehrfach in einer Schleife gezeichnet.
# Dies ist ein Kommentar.
def draw(step):
    win = pygame.display.get_surface()
    win.fill((0, 0, 0))
    circle_move_right(win, 50, 250, 50, step*10, (255, 0, 0))
    circle_move_right(win, 50, 70, 70, step*10, (255, 255, 0))
    pygame.display.update()


#Hauptteil
pygame.init()
pygame.display.set_mode((500, 500))
pygame.display.set_caption("Bewegungen")

bRun = True
step = 0
step_back = False

while bRun:
    pygame.time.delay(100)
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            bRun = False

    # Hintergrund und Kreise für den aktuellen Step zeichnen.
    draw(step)

    # Merke dir, ob der Kreis sich vorwärts oder rückwärts bewegt (step_back)
    # Gehe solange nach vorne, bis du den rechten Rand erreichst, danach gehst
    # du rückwärts
    # Hier wird der Step für den nächsten Schleifendurchlauf ermittelt.
    if step_back:
        step -= 1
        if step <= 0:
            step_back = False
    else:
        step += 1
        if step * 10 >= 500:
            step_back = True

pygame.quit()

