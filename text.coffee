module.exports = (req, res, next)->
  if req.is 'text/*'
    req.text = ''
    req.setEncoding 'utf8'
    req.on 'data', (chunk)-> req.text += chunk
    req.on 'end', next
  else
    next()
