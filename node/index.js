import express from 'express'
const app = express()

app.use(express.json())

app.get('/healthz', (req, res) => {
    res.send('OK')
})

app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000')
})