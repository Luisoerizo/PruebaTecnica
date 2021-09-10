import fetch from "node-fetch"

fetch("https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow")
    .then(response => response.json())
    .then(data => {
        const items = data.items

        const Answers = () => {
            const total = items.length

            let answered = items.filter(i => i.is_answered).length
            let notAnswered = total - answered

            console.log('=============================================================')
            console.log('2. Obtener el número de respuestas contestadas y no contestadas')
            console.log('Contestados: ', answered)
            console.log('No contestados: ', notAnswered)
            console.log('=============================================================')
        }

        const Owners = () => {
            const Owners = items.map((Item) =>{
                return (
                    Item.owner.hasOwnProperty("reputation") && Item.owner.reputation
                )
            })

            const MaxOwner = Math.max.apply(
                Math, Owners
            )

            console.log('3. Obtener la respuesta con mayor owners')
            console.log('Respuesta con mas Owners: ', MaxOwner)
            console.log('=============================================================')

        };

        const Vistas = () => {
            const Views = items.map((Item) =>{
                return Item.view_count
            })

            const MinViews = Math.min.apply(
                Math, Views
            )            

            console.log('4. Obtener la respuesta con menor número de vistas')
            console.log('Respuesta con menos vistas: ', MinViews)
            console.log('=============================================================')

        }

        const Respuestas = () => {
            const Latest = Math.max.apply(
                Math, items.map((Item) => {
                    return Item.creation_date
                })
            )

            const Oldest = Math.min.apply(
                Math, items.map(function (Item) {
                    return Item.creation_date
                })
            )

            console.log('5. Obtener la respuesta mas vieja y mas actual')
            console.log('Respuesta más antigua: ', Oldest)
            console.log('Respuesta más reciente: ', Latest)
            console.log('=============================================================')
        }

        Answers();
        Owners();
        Vistas();
        Respuestas();
    })