import           Graphics.Rendering.OpenGL
import           Graphics.UI.GLUT




genLineCirc ::  GLfloat -> [(GLfloat,GLfloat,GLfloat)]
genLineCirc s = map (\k -> (s*sin(2*pi*k/24),s*cos(2*pi*k/24),0.0)) [1..24]

circ :: [(GLfloat,GLfloat,GLfloat)]
circ = genLineCirc 1

main :: IO()
main = do
    (progname, _) <- getArgsAndInitialize
    createWindow "hello, world"
    displayCallback $= display
    mainLoop
    
renderCirc :: PrimitiveMode -> [(GLfloat,GLfloat,GLfloat)] -> IO()
renderCirc mode circ =  renderPrimitive mode $ mapM_ (\(x, y, z)-> vertex $ Vertex3 x y z) circ
renderCircLine circ = renderCirc  LineLoop circ

display = do
  clear [ColorBuffer]
  color $ Color3 (1.0 :: GLfloat) 1.0 1.0
  --renderPrimitive Polygon $ mapM_ (\(x, y, z)->vertex $ Vertex3 x y z) circ
  renderCirc Polygon (genLineCirc 1) 
  color $ Color3 (0.0 :: GLfloat) 0.0 0.0
  mapM_ (\s -> renderCircLine (genLineCirc s)) $ map (\k -> 1/(2**k)) [1..10]
  flush









