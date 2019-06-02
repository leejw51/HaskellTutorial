main =  do
  let (a:b:c) = [1,2,3,4,5]
  let abc = [10,20,30,40,50]
  let abcinit = init abc
  let abclast= last abc
  print abc
  print abcinit
  print abclast