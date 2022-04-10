# StarWarsStarships

## UX/UI/architecture/requirements assumptions
- Fully SwiftUI app using one view model
- UI is optimised for iPhone, however it works on iPad as well
- No need to fetch new details from the API when visitng the Detail page (`DetailView`)
- Name and Length properties of starships are reasonable to sort by
- Favourites are represented by the heart icon. Filled hearts indicates favourited items.

## Known issues
- A rendering issue may occur on the list view after a new sort is applied. Scrolling around or switching sort options will fix it.
