import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

main = do
    (progname, _) <- getArgsAndInitialize
    createWindow "hello, world"
    mainLoop
    

